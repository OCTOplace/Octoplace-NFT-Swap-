//SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";

interface ISwapData {
    struct SwapListing {
        uint256 listingId;
        IERC721 TokenAddress;
        uint256 tokenId;
        address tokenOwner;
        uint256 transactionChargeBips;
        bool isCompleted;
        bool isCancelled;
        uint256 transactionCharge;
    }

    struct SwapOffer {
        uint256 offerId;
        IERC721 offerTokenAddress;
        uint256 offerTokenId;
        address offerTokenOwner;
        IERC721 listingTokenAddress;
        uint256 listingTokenId;
        address listingTokenOwner;
        uint256 transactionChargeBips;
        bool isCompleted;
        bool isCancelled;
        uint256 transactionCharge;
    }

    struct Trade {
        uint256 tradeId;
        uint256 listingId;
        uint256 offerId;
    }

    function addListing(SwapListing memory listing) external;

    function removeListingById(uint256 id) external;

    function updateListing(SwapListing memory listing) external;

    function readListingById(uint256 id)
        external
        view
        returns (SwapListing memory);

    function addOffer(SwapOffer memory offer) external;

    function removeOfferById(uint256 id) external;

    function updateOffer(SwapOffer memory offer) external;

    function readOfferById(uint256 id) external view returns (SwapOffer memory);

    function addTrade(Trade memory trade) external;

    function readTradeById(uint256 id) external view returns (Trade memory);

    function readAllListings() external view returns (SwapListing[] memory);

    function readAllOffers() external view returns (SwapOffer[] memory);

    function readAllTrades() external view returns (Trade[] memory);
}