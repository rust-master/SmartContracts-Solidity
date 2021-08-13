const assert = require('assert');
const ganache = require('ganache-cli');
const Web3 = require('web3');
const web3 = new Web3(ganache.provider());

class Car {
  park() {
    return "Parked";
  }

  drive() {
    return "Driving";
  }
}

// write mocha test
describe("Car", () => {
  it("can park", () => {
    const car = new Car();
    assert.equal(car.park(), "Parked");
  });

  it("can drive", () => {
      const car = new Car();
      assert.equal(car.drive(), "Driving");
  });
});
