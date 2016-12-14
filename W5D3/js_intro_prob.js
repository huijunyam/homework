function mysteryScoping1() {
  var x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x); //in block
  }
  console.log(x); //in block
}

function mysteryScoping2() {
  const x = 'out of block';
  if (true) {
    const x = 'in block';
    console.log(x); //in block
  }
  console.log(x); //out of block
}

function mysteryScoping3() {
  const x = 'out of block';
  if (true) {
    var x = 'in block'; //syntax error
    console.log(x); //x is not defined
  }
  console.log(x);
}

function mysteryScoping4() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x); //in block
  }
  console.log(x); //out of block
}

function mysteryScoping5() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x); //in block
  }
  let x = 'out of block again'; //syntax error
  console.log(x); // x is not defined
}

function madLib(verb, adj, noun){
  return `We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}.`;
}

function isSubstring(searchString, subString){
  return searchString.indexOf(subString) !== -1;
}

function fizzBuzz(array){
  var newArray = [];
  for (let i = 0; i < array.length; i++){
    if (array[i] % 3 === 0 && array[i] % 5 === 0){
      continue;
    }
    else if (array[i] % 3 === 0 || array[i] % 5 === 0){
      newArray.push(array[i]);
    }
  }
  return newArray;
}

function fizzBuzz (array) {
  const fizzBuzzArr = [];

  array.forEach(el => {
    if ((el % 3 === 0) ^ (el % 5 === 0)) {
      fizzBuzzArr.push(el);
    }
  });

  return fizzBuzzArr;
}

function isPrime(number){
  if (number < 2) { return false; }
  for (let i = 2; i < number; i++){
    if (number % i === 0) { return false; }
  }
  return true;
}

function firstNPrimes(n){
  var result = [];
  var count = 1;
  while (result.length < n){
    if (isPrime(count)) {result.push(count)};
    count++;
  }
  return result;
}

function sumOfNPrimes(n){
  return firstNPrimes(n).reduce(function(a, b) {
    return a + b;
  }, 0);
}

function allOrNothing(mod, ...numbers) {
  for (let i = 0; i < numbers.length; i++) {
    if (numbers[i] % mod !== 0) {
      return false;
    }
  }
  return true;
}

function titleize(array, callback){
  let titleized = array.map(name => `Mx. ${name} Jingleheimer Schmidt`);
  callback(titleized);
}

titleize(["Mary", "Brian", "Leo"], (names) => {
  names.forEach(name => console.log(name));
});

function Elephant(name, height, tricks) {
  this.name = name;
  this.height = height;
  this.tricks = tricks;
}

Elephant.prototype.trumpet = function () {
  console.log(`${this.name} phrRRRRRRRRRRRRRR!!!!`);
};

Elephant.prototype.grow = function () {
  this.height += 12;
};

Elephant.prototype.addTrick = function (trick) {
  this.tricks.push(trick);
};


Elephant.prototype.play = function () {
  index = Math.floor(Math.random() * this.tricks.length);
  console.log(`${this.name} is ${this.tricks[index]}`);
};

let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];

Elephant.paradeHelper = function (elephant) {
  console.log(`${elephant.name} is trotting by!`);
};

herd.forEach( (elephant) => Elephant.paradeHelper(elephant) );

function dinerBreakfast() {
  order = "I'd like cheesy scrambled eggs please";
  console.log(order);
  return function (food) {
    order = `${order.slice(0, order.length - 8)} and ${food} please.`;
    console.log(order);
  };
}
