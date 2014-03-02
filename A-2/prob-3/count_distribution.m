clear;

load 'non_homogenous_poisson.mat';

spike_counr_for_angle = 0;
spike_count_in_train = zeros(1,100);
for j=1:100
    spike_train = spike_train_container{j};
    spike_count_in_train(j) = size(find(spike_train),2);

end
count_frequencies = unique(spike_count_in_train);
counts = histc(spike_count_in_train,count_frequencies);
plot(counts/sum(counts));
hold on
plot(poisspdf(1:size(counts,2),mean(counts)), 'r--');
hold on
xlabel('Count Frequency');
ylabel('Number Of Observations');
str = sprintf('Count Distribution');
title(str);
legend('Actual Dist', 'Poisson Dist');

