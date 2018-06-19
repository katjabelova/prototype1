/* range: [0.05, 0.4]*/
var investment_share = 0.25;
/* range: [0.05, 0.8]*/
var agrar_share = 0.33;
var relative_nr = 2;
var relative_fm = 3;
var relative_ma = 6;
var relative_hr = 1;
var years = [1,2,3,4,5,6,7,8,9,10];

function output_wzs() {
  var output_array = [];

  NONAG = investment_share * (1 - agrar_share);
  NR = investment_share * agrar_share * relative_nr / (relative_nr + relative_fm + relative_ma + relative_hr);
  FM = investment_share * agrar_share * relative_fm / (relative_nr + relative_fm + relative_ma + relative_hr);
  MA = investment_share * agrar_share * relative_ma / (relative_nr + relative_fm + relative_ma + relative_hr);
  HR = investment_share * agrar_share * relative_hr / (relative_nr + relative_fm + relative_ma + relative_hr);

  wZ1 = 0.03815609 + 0.009317891 * NR + -0.09422917 * NR * NR + 0.01042949 * FM + -0.1066363 * FM * FM + 0.04761692 * MA + -0.2115398 * MA * MA + 0.008736629 * HR + -0.08689586 * HR * HR + 0.2355192 * NONAG + -0.3277703 * NONAG * NONAG;
  wZ2 = 0.002992926 + 0.01636231 * NR + -0.06932432 * NR * NR + 0.03757891 * FM + -0.1557839 * FM * FM + 0.02726628 * MA + -0.1040575 * MA * MA + 0.02314826 * HR + -0.09319288 * HR * HR + 0.05986973 * NONAG + -0.07809279 * NONAG * NONAG;
  wZ3 = 0.08384501 + -0.7482027 * NR + -0.4816802 * NR * NR + -0.573682 * FM + -1.117864 * FM * FM + -0.6393244 * MA + -0.8277594 * MA * MA + -0.6944213 * HR + -0.6600634 * HR * HR + -0.3013967 * NONAG + -0.7381306 * NONAG * NONAG;
  wZ4 = 0.05460506 + 0.1725816 * NR + -0.7801275 * NR * NR + 0.300523 * FM + -1.274792 * FM * FM + 0.1717909 * MA + -0.7029481 * MA * MA + 0.1937015 * HR + -0.8254542 * HR * HR + 0.1793275 * NONAG + -0.2468094 * NONAG * NONAG;
  wZ5 = 0.03781077 + 0.04533998 * NR + -0.2022937 * NR * NR + 0.1167748 * FM + -0.4649394 * FM * FM + 0.09289019 * MA + -0.3516543 * MA * MA + 0.0672851 * HR + -0.2737941 * HR * HR + 0.2295746 * NONAG + -0.2929575 * NONAG * NONAG;
  wZ6 = 0.0434538 + 0.01437698 * NR + -0.07777468 * NR * NR + 0.03920955 * FM + -0.1656638 * FM * FM + 0.04896659 * MA + -0.2155554 * MA * MA + 0.02191561 * HR + -0.1060559 * HR * HR + 0.1342406 * NONAG + 0.07673141 * NONAG * NONAG;
  wZ7 = -0.000006415758 + 0.000001345764 * NR + 0.000006775817 * NR * NR + -0.000003279563 * FM + 0.00001479488 * FM * FM + -0.000008525427 * MA + 0.00004173186 * MA * MA + 0.000002755462 * HR + 0.000004497611 * HR * HR + -0.00005203285 * NONAG + 0.00006610333 * NONAG * NONAG;

  output_array.push(Number((wZ1).toFixed(3)));
  output_array.push(Number((wZ2).toFixed(3)));
  output_array.push(Number((wZ3).toFixed(3)));
  output_array.push(Number((wZ4).toFixed(3)));
  output_array.push(Number((wZ5).toFixed(3)));
  output_array.push(Number((wZ6).toFixed(3)));
  output_array.push(Number((wZ7).toFixed(3)));

  return output_array;
};

function output_z1() {
  var output_array = [];

  NONAG = investment_share * (1 - agrar_share);
  NR = investment_share * agrar_share * relative_nr / (relative_nr + relative_fm + relative_ma + relative_hr);
  FM = investment_share * agrar_share * relative_fm / (relative_nr + relative_fm + relative_ma + relative_hr);
  MA = investment_share * agrar_share * relative_ma / (relative_nr + relative_fm + relative_ma + relative_hr);
  HR = investment_share * agrar_share * relative_hr / (relative_nr + relative_fm + relative_ma + relative_hr);

  wZ1 = 0.03815609 + 0.009317891 * NR + -0.09422917 * NR * NR + 0.01042949 * FM + -0.1066363 * FM * FM + 0.04761692 * MA + -0.2115398 * MA * MA + 0.008736629 * HR + -0.08689586 * HR * HR + 0.2355192 * NONAG + -0.3277703 * NONAG * NONAG;

  output_array = years.map(function(year) { return Number((858.6967 * (1 + (year - 1) * wZ1)).toFixed(3)); });

  return output_array;
};

function output_z2() {
  var output_array = [];

  NONAG = investment_share * (1 - agrar_share);
  NR = investment_share * agrar_share * relative_nr / (relative_nr + relative_fm + relative_ma + relative_hr);
  FM = investment_share * agrar_share * relative_fm / (relative_nr + relative_fm + relative_ma + relative_hr);
  MA = investment_share * agrar_share * relative_ma / (relative_nr + relative_fm + relative_ma + relative_hr);
  HR = investment_share * agrar_share * relative_hr / (relative_nr + relative_fm + relative_ma + relative_hr);

  wZ2 = 0.002992926 + 0.01636231 * NR + -0.06932432 * NR * NR + 0.03757891 * FM + -0.1557839 * FM * FM + 0.02726628 * MA + -0.1040575 * MA * MA + 0.02314826 * HR + -0.09319288 * HR * HR + 0.05986973 * NONAG + -0.07809279 * NONAG * NONAG;

  output_array = years.map(function(year) { return Number(((100 - ( 85.46574 * (1 + (year - 1) * wZ2))) * 3).toFixed(3)); });

  return output_array;
};

function output_z3() {
  var output_array = [];

  NONAG = investment_share * (1 - agrar_share);
  NR = investment_share * agrar_share * relative_nr / (relative_nr + relative_fm + relative_ma + relative_hr);
  FM = investment_share * agrar_share * relative_fm / (relative_nr + relative_fm + relative_ma + relative_hr);
  MA = investment_share * agrar_share * relative_ma / (relative_nr + relative_fm + relative_ma + relative_hr);
  HR = investment_share * agrar_share * relative_hr / (relative_nr + relative_fm + relative_ma + relative_hr);

  wZ3 = 0.08384501 + -0.7482027 * NR + -0.4816802 * NR * NR + -0.573682 * FM + -1.117864 * FM * FM + -0.6393244 * MA + -0.8277594 * MA * MA + -0.6944213 * HR + -0.6600634 * HR * HR + -0.3013967 * NONAG + -0.7381306 * NONAG * NONAG;

  output_array = years.map(function(year) { return Number((379.7354 * (1 + (year - 1) * wZ3)).toFixed(3)); });

  return output_array;
};

function output_z4() {
  var output_array = [];

  NONAG = investment_share * (1 - agrar_share);
  NR = investment_share * agrar_share * relative_nr / (relative_nr + relative_fm + relative_ma + relative_hr);
  FM = investment_share * agrar_share * relative_fm / (relative_nr + relative_fm + relative_ma + relative_hr);
  MA = investment_share * agrar_share * relative_ma / (relative_nr + relative_fm + relative_ma + relative_hr);
  HR = investment_share * agrar_share * relative_hr / (relative_nr + relative_fm + relative_ma + relative_hr);

  wZ4 = 0.05460506 + 0.1725816 * NR + -0.7801275 * NR * NR + 0.300523 * FM + -1.274792 * FM * FM + 0.1717909 * MA + -0.7029481 * MA * MA + 0.1937015 * HR + -0.8254542 * HR * HR + 0.1793275 * NONAG + -0.2468094 * NONAG * NONAG;

  output_array = years.map(function(year) { return Number((121.74 * (1 + (year - 1) * wZ4)).toFixed(3)); });

  return output_array;
};

function output_z5() {
  var output_array = [];

  NONAG = investment_share * (1 - agrar_share);
  NR = investment_share * agrar_share * relative_nr / (relative_nr + relative_fm + relative_ma + relative_hr);
  FM = investment_share * agrar_share * relative_fm / (relative_nr + relative_fm + relative_ma + relative_hr);
  MA = investment_share * agrar_share * relative_ma / (relative_nr + relative_fm + relative_ma + relative_hr);
  HR = investment_share * agrar_share * relative_hr / (relative_nr + relative_fm + relative_ma + relative_hr);

  wZ5 = 0.03781077 + 0.04533998 * NR + -0.2022937 * NR * NR + 0.1167748 * FM + -0.4649394 * FM * FM + 0.09289019 * MA + -0.3516543 * MA * MA + 0.0672851 * HR + -0.2737941 * HR * HR + 0.2295746 * NONAG + -0.2929575 * NONAG * NONAG;

  output_array = years.map(function(year) { return  Number((3625.429 * (1 + (year - 1) * wZ5)).toFixed(3)); });

  return output_array;
};

function output_z6() {
  var output_array = [];

  NONAG = investment_share * (1 - agrar_share);
  NR = investment_share * agrar_share * relative_nr / (relative_nr + relative_fm + relative_ma + relative_hr);
  FM = investment_share * agrar_share * relative_fm / (relative_nr + relative_fm + relative_ma + relative_hr);
  MA = investment_share * agrar_share * relative_ma / (relative_nr + relative_fm + relative_ma + relative_hr);
  HR = investment_share * agrar_share * relative_hr / (relative_nr + relative_fm + relative_ma + relative_hr);

  wZ6 = 0.0434538 + 0.01437698 * NR + -0.07777468 * NR * NR + 0.03920955 * FM + -0.1656638 * FM * FM + 0.04896659 * MA + -0.2155554 * MA * MA + 0.02191561 * HR + -0.1060559 * HR * HR + 0.1342406 * NONAG + 0.07673141 * NONAG * NONAG;

  output_array = years.map(function(year) { return  Number((1405.489 * (1 + (year - 1) * wZ6)).toFixed(3)); });

  return output_array;
};

function output_z7() {
  var output_array = [];

  NONAG = investment_share * (1 - agrar_share);
  NR = investment_share * agrar_share * relative_nr / (relative_nr + relative_fm + relative_ma + relative_hr);
  FM = investment_share * agrar_share * relative_fm / (relative_nr + relative_fm + relative_ma + relative_hr);
  MA = investment_share * agrar_share * relative_ma / (relative_nr + relative_fm + relative_ma + relative_hr);
  HR = investment_share * agrar_share * relative_hr / (relative_nr + relative_fm + relative_ma + relative_hr);

  wZ7 = -0.000006415758 + 0.000001345764 * NR + 0.000006775817 * NR * NR + -0.000003279563 * FM + 0.00001479488 * FM * FM + -0.000008525427 * MA + 0.00004173186 * MA * MA + 0.000002755462 * HR + 0.000004497611 * HR * HR + -0.00005203285 * NONAG + 0.00006610333 * NONAG * NONAG;

  output_array = years.map(function(year) { return Number((99.96191 * (1 + (year - 1) * wZ7)).toFixed(3)); });

  return output_array;
};
