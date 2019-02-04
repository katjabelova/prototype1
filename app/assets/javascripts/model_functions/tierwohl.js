var alpha_place = [];
var alpha_climate = [];
var alpha_social = [];

alpha_place[0] = 0.0265532263464349;
alpha_place[1] = 0.806390555352322;

alpha_climate[0] = 0.0160462896515806;
alpha_climate[1] = 0.879118155786774;

alpha_social[0] = 0.0266691723988446;
alpha_social[1] = 0.795859672693153;

var rho = -0.333333333333333;

var mu1 = [];
mu1[0] = 0.247;
mu1[1] = 0.291;
mu1[2] = 0.462;

var mu2 = [];
mu2[0] = 0.247;
mu2[1] = 0.291;
mu2[2] = 0.462;

var mu3 = [];
mu3[0] = 0.247;
mu3[1] = 0.291;
mu3[2] = 0.462;

var mu4 = [];
mu4[0] = 0.247;
mu4[1] = 0.291;
mu4[2] = 0.462;

var mu = [];

var eta = 1;

var budget_tierwohl = 50;
var budget_place = 50;
var budget_climate = 50;
var budget_social = 50;

var input = {
  budget_tierwohl: budget_tierwohl,
  budget_place: budget_place,
  budget_climate: budget_climate,
  budget_social: budget_social,
}

function normalizedInput(inputArray) {
  var sum = 0;
  for(i = 1; i < inputArray.length; i++) {
    sum += inputArray[i];
  }
  return sum;
}

function calculate(input) {
  var inputArray = [];


Object.keys(input).forEach(function (key) {
    var value = input[key]
    inputArray.push(value);
});


var z5 = (inputArray[0] / 100) * 5500;

//pro Tier
var z6 = z5 * (inputArray[1] / normalizedInput(inputArray)) / 12;
var z7 = z5 * (inputArray[2] / normalizedInput(inputArray)) / 12;
var z8 = z5 * (inputArray[3] / normalizedInput(inputArray)) / 12;

var z2 = alpha_place[0] * Math.pow(z6, alpha_place[1]);
var z3 = alpha_climate[0] * Math.pow(z7, alpha_climate[1]);
var z4 = alpha_social[0] * Math.pow(z8, alpha_social[1]);

var tierwohl_array = [z2, z3, z4];
var tierwohl_sum = 0;
for(i = 0; i < tierwohl_array.length; i++) {
  tierwohl_sum += mu[i] * Math.pow(tierwohl_array[i], -rho);
}

var z1 = eta * Math.pow(tierwohl_sum, (1 / - rho));

var z9 =  z5/z1 * 1/90 / 12;
var z10 = z6/z2 * 1/90;
var z11 = z7/z3 * 1/90;
var z12 = z8/z4 * 1/90;

var budgets_ = [z5, z6, z7, z8];
var indicators_ = [z1, z2, z3, z4];
var costs_ = [z9, z10, z11, z12];

var output = {
  budgets_ : budgets_,
  indicators_ : indicators_,
  costs_ : costs_
}
  return output;
}

var result = calculate(input);

function updateValues() {
  input = {
    budget_tierwohl: budget_tierwohl,
    budget_place: budget_place,
    budget_climate: budget_climate,
    budget_social: budget_social,
  };
  return result = calculate(input);
};

function v_budgets_() {
   return result.budgets_;
};
function v_indicators_() {
   return result.indicators_;
};
function v_costs_() {
   return result.costs_;
};

function budgets_() {
  var updatedResult = updateValues();
  return updatedResult.budgets_;
};
function indicators_() {
   var updatedResult = updateValues();
   return updatedResult.indicators_;
};
function costs_() {
  var updatedResult = updateValues();
  return updatedResult.costs_;
};
