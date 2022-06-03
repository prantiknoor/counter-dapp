const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Counter", function () {
  it("Should increase the counter by 1 after calling increment", async function () {
    const Counter = await ethers.getContractFactory("Counter");
    const counter = await Counter.deploy();
    await counter.deployed();

    expect(await counter.count()).to.equal(0);

    const setGreetingTx = await counter.incrementCounter();

    // wait until the transaction is mined
    await setGreetingTx.wait();

    expect(await counter.count()).to.equal(1);
  });
});
