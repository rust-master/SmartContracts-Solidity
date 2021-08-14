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

beforeEach(() => {
  console.log("Before each");
  const car = new Car();
});

// write mocha test
describe("Car", () => {
  it("can park", () => {
    assert.equal(car.park(), "Parked");
  });

  it("can drive", () => {
      assert.equal(car.drive(), "Driving");
  });
});
