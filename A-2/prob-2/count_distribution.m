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
       
    end
    count_frequencies = unique(spike_count_in_train);
    counts = histc(spike_count_in_train,count_frequencies);
    plot(counts/sum(counts));
    hold on;
    plot(poisspdf(1:10000, lambda_list(i)), '--rx');
    xlabel('Count Frequency');
    ylabel('Number Of Observations');
    axis([0,100,0,0.25]);
    str = sprintf('Count Distribution for %d*pi/4', i-1);
    title(str);
    legend('Actual Dist', 'Poisson Dist');
end
