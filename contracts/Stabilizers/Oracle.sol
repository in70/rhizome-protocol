import "../RHToken/RHToken.sol";

pragma solidity ^0.5.16;

contract PriceOracle {
    /// @notice Indicator that this is a PriceOracle contract (for inspection)
    bool public constant isPriceOracle = true;

    /**
     * @notice Get the underlying price of a rhToken asset
     * @param rhToken The rhToken to get the underlying price of
     * @return The underlying asset price mantissa (scaled by 1e18).
     *  Zero means the price is unavailable.
     */
    function getUnderlyingPrice(RHToken rhToken) external view returns (uint);
}

interface Feed {
    function decimals() external view returns (uint8);

    function latestAnswer() external view returns (uint);
}

contract Oracle is PriceOracle {
    struct FeedData {
        address addr;
        uint8 tokenDecimals;
    }

    address public owner;
    address public keeper;
    mapping(address => FeedData) public feeds; // rhToken -> feed data
    mapping(address => uint) public fixedPrices; // rhToken -> price
    uint8 constant DECIMALS = 36;

    modifier onlyOwner() {
        require(msg.sender == owner, "ONLY OWNER");
        _;
    }

    constructor() public {
        owner = tx.origin;
    }

    function changeOwner(address owner_) public onlyOwner {
        owner = owner_;
    }

    function setFeed(
        RHToken rhToken_,
        address feed_,
        uint8 tokenDecimals_
    ) public onlyOwner {
        feeds[address(rhToken_)] = FeedData(feed_, tokenDecimals_);
    }

    function removeFeed(RHToken rhToken_) public onlyOwner {
        delete feeds[address(rhToken_)];
    }

    function setFixedPrice(RHToken rhToken_, uint price) public {
        require(
            msg.sender == owner || msg.sender == keeper,
            "ONLY OWNER OR KEEPER"
        );
        fixedPrices[address(rhToken_)] = price;
    }

    function removeFixedPrice(RHToken rhToken_) public onlyOwner {
        delete fixedPrices[address(rhToken_)];
    }

    function setKeeper(address keeper_) public onlyOwner {
        keeper = keeper_;
    }

    function getUnderlyingPrice(RHToken rhToken_) public view returns (uint) {
        // FeedData memory feed = feeds[address(rhToken_)]; // gas savings
        // if (feed.addr != address(0)) {
        //     uint decimals = uint(
        //         DECIMALS - feed.tokenDecimals - Feed(feed.addr).decimals()
        //     );
        //     require(decimals <= DECIMALS, "DECIMAL UNDERFLOW");
        //     return Feed(feed.addr).latestAnswer() * (10 ** decimals);
        // }

        return fixedPrices[address(rhToken_)];
    }
}
