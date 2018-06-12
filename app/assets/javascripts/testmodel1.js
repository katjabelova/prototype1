function output_z1(investment_share, agrar_share, relative_nr, relative_fm, relative_ma, relative_hr) {
  window.alert('lala');
  var years = [1,2,3,4,5,6,7,8,9,10]
  var output_array = [];

  NONAG = investment_share * (1 - agrar_share);
  NR = investment_share * agrar_share * relative_nr / (relative_nr + relative_fm + relative_ma + relative_hr);
  FM = investment_share * agrar_share * relative_fm / (relative_nr + relative_fm + relative_ma + relative_hr);
  MA = investment_share * agrar_share * relative_ma / (relative_nr + relative_fm + relative_ma + relative_hr);
  HR = investment_share * agrar_share * relative_hr / (relative_nr + relative_fm + relative_ma + relative_hr);

  wZ1 = 0.03815609 + 0.009317891 * NR + -0.09422917 * NR * NR + 0.01042949 * FM + -0.1066363 * FM * FM + 0.04761692 * MA + -0.2115398 * MA * MA + 0.008736629 * HR + -0.08689586 * HR * HR + 0.2355192 * NONAG + -0.3277703 * NONAG * NONAG;

  output_array = years.map(function(year) { return 858.6967 * (1 + (year - 1) * wZ1); });
  window.alert('output: ' + output_array.toString());
  return output_array;
};
