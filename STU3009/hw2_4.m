prior = [0.05, 0.10, 0.05, 0.05; 0.05, 0.10, 0.05, 0.05; 0.05, 0.05, 0.10, 0.05; 0.05, 0.05, 0.10, 0.05];
likelihood = [0.75, 0.95, 0.75, 0.05; 0.05, 0.75, 0.95, 0.75; 0.01, 0.05, 0.75, 0.95; 0.01, 0.01, 0.05, 0.75];
posterior = zeros(4,4); %initialising array for posterior
evidence = 0; %initialising evidence

for i = 1:16
    %multiply each element and sum to get evidence
    evidence = likelihood(i) .* prior(i) + evidence; 
end

for i = 1:16
    %according to Bayes rule, posterior = likelihood * prior / evidence
    posterior(i) = likelihood(i) .* prior(i) / evidence;
end

disp(posterior)