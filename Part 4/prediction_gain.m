function [output] = prediction_gain( signal, error )
vs = var(signal);
ve = var(error);
output = 10*log10(vs/ve);
end

