permutations = 0; %counting total number of permuations
no_2s = 0; %event that no 2s are in the outcome
%generating all possible outcomes
for throw1 = 1:6 
  for throw2 = 1:6
    for throw3 = 1:6
	  permutations = permutations + 1; %getting all permutations
	    if (throw1 ~= 2) && (throw2 ~= 2) && (throw3 ~= 2)
		  no_2s = no_2s + 1; %count event when there are no 2's
	   end
    end
  end
end
fprintf('total %f\n', permutations)
fprintf('total %f\n', no_2s)
%obtain probability for at least one 2
fprintf('prob %f\n',(permutations-no_2s)/permutations) 