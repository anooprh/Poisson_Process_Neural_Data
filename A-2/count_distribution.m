clear;

load 'homogenous_poisson.mat';

for i=1:8
    spike_train_container = cell_holder{i};
    spike_counr_for_angle = 0;
    figure;
    spike_count_in_train = zeros(1,100);
    for j=1:100
        spike_train = spike_train_container{j};
        spike_count_in_train(j) = size(find(spike_train),2);
        spike_counr_for_angle = spike_counr_for_angle + spike_count_in_train(j);
       
    end
    count_frequencies = unique(spike_count_in_train);
    counts = histc(spike_count_in_train,count_frequencies);
    plot(counts/sum(counts));
    hold on;
    plot(poisspdf(1:100, lambda_list(i)), 'r');
    xlabel('Count Frequency');
    ylabel('Number Of Observations');
    str = sprintf('Count Distribution for %d*pi/4', i-1);
    title(str);
    legend('Actual Dist', 'Poisson Dist');
    mean_spike_count_for_angle = spike_counr_for_angle /100;
end
