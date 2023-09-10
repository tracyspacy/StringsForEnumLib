
const { expectRevert } = require("@openzeppelin/test-helpers");

const TestEnumContract = artifacts.require("TestEnumContract");
const StringsForEnum = artifacts.require("StringsForEnum"); 
contract("TestEnumContract", (accounts) => {
  let testEnumContract;
  let stringsForEnum;

  before(async () => {
    testEnumContract = await TestEnumContract.new();
    // Deploy the StringsForEnum contract if it's not already deployed
    // stringsForEnum = await StringsForEnum.new();
  });

  it("should return the default choice as 'GoStraight'", async () => {
    const defaultChoiceStr = await testEnumContract.getDefaultChoiceStr();
    assert.equal(defaultChoiceStr, "GoStraight");
    //console.log(defaultChoiceStr);
  });

  it("should return the default choice as tuple 2 and 'GoStraight'", async () => {
  const result = await testEnumContract.getDefaultChoiceIntWithStr();
  assert.equal(result[0], 2);
  assert.equal(result[1], "GoStraight");
  //console.log((result[0]).toString(),result[1]);
});



it("should revert when trying to get a non-valid enum value", async () => {
   await expectRevert.unspecified(
    testEnumContract.getNotValidEnum(42)
  );
});

  it("should set the choice to 'GoStraight'", async () => {
    await testEnumContract.setGoStraight();
    const choiceStr = await testEnumContract.getChoiceStr();
    assert.equal(choiceStr, "GoStraight");
  });

  it("should return the largest enum value as 'SitStill'", async () => {
    const largestValueStr = await testEnumContract.getLargestValueStr();
    assert.equal(largestValueStr, "SitStill");
    //console.log(largestValueStr);
  });

  it("should return the smallest enum value as 'GoLeft'", async () => {
    const smallestValueStr = await testEnumContract.getSmallestValueStr();
    assert.equal(smallestValueStr, "GoLeft");
    //console.log(smallestValueStr);
  });


});
