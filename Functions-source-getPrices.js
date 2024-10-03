// Import ethers library
const { ethers } = await import("npm:ethers@6.10.0");

// Create ABI coder for data encoding
const abiCoder = ethers.AbiCoder.defaultAbiCoder();

// Get token ID from input arguments
const tokenId = args[0];

// Fetch property data from API
const apiResponse = await Functions.makeHttpRequest({
    url: `https://api.bridgedataoutput.com/api/v2/OData/test/Property('P_5dba1fb94aa4055b9f29696f')?access_token=6baca547742c6f96a6ff71b138424f21`,
});

// Extract and convert pricing data to numbers
const listPrice = Number(apiResponse.data.ListPrice);
const originalListPrice = Number(apiResponse.data.OriginalListPrice);
const taxAssessedValue = Number(apiResponse.data.TaxAssessedValue);

// Encode data for NFT use
const encoded = abiCoder.encode(
    [`uint256`, `uint256`, `uint256`, `uint256`],
    [tokenId, listPrice, originalListPrice, taxAssessedValue]
);

// Log data for verification
console.log(
    `Token ID: ${tokenId} \nList Price: ${listPrice} \nOriginal List Price: ${originalListPrice} \nTax Assessed Value: ${taxAssessedValue}`
);

// Return encoded data as bytes
return ethers.getBytes(encoded);