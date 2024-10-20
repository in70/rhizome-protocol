import "../RHToken/RHErc20.sol";
import "../Utils/SafeMath.sol";
import "./ERC20.sol";
    
pragma solidity ^0.5.16;

contract MonetaryPolicy {
    using SafeMath for uint;

    RHErc20 public rhtoken;
    ERC20 public underlying;
    address public fed;
    address public gov;
    uint public supply;

    event Expansion(uint amount);
    event Contraction(uint amount);

    constructor(RHErc20 rhtoken_) public {
        rhtoken = rhtoken_;
        underlying = ERC20(rhtoken_.underlying());
        underlying.approve(address(rhtoken), uint(-1));
        fed = tx.origin;
        gov = tx.origin;
    }

    function changeGov(address newGov_) public {
        require(msg.sender == gov, "ONLY GOV");
        gov = newGov_;
    }

    function changeFed(address newFed_) public {
        require(msg.sender == gov, "ONLY GOV");
        fed = newFed_;
    }

    function resign() public {
        require(msg.sender == fed, "ONLY FED");
        fed = address(0);
    }

    function expansion(uint amount) public {
        require(msg.sender == fed, "ONLY FED");
        underlying.mint(address(this), amount);
        require(rhtoken.mint(amount, false) == 0, 'Supplying failed');
        supply = supply.add(amount);
        emit Expansion(amount);
    }

    function contraction(uint amount) public {
        require(msg.sender == fed, "ONLY FED");
        require(amount <= supply, "AMOUNT TOO BIG"); // can't burn profits
        require(rhtoken.redeemUnderlying(amount) == 0, "Redeem failed");
        underlying.burn(amount);
        supply = supply.sub(amount);
        emit Contraction(amount);
    }

    function takeProfit() public {
        uint underlyingBalance = rhtoken.balanceOfUnderlying(address(this));
        uint profit = underlyingBalance.sub(supply);
        if(profit > 0) {
            require(rhtoken.redeemUnderlying(profit) == 0, "Redeem failed");
            underlying.transfer(gov, profit);
        }
    }
    
}
