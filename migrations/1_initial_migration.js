const TestEnumContract = artifacts.require("testEnumContract");

module.exports = async function (deployer) {
  deployer.deploy(TestEnumContract);
};
