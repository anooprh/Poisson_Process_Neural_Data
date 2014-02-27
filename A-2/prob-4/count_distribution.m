clear;

load 'ps2_data';

for i=1:8
    spike_counr_for_angle = 0;
    figure;
    spike_count_in_train = zeros(1,182);
    for j=1:182
        spike_train = trial(j,i).spikes;
        spike_count_in_train(j) = size(find(spike_train),2);
       
    end
    count_frequencies = unique(spike_count_in_train);
    counts = histc(spike_count_in_train,count_frequencies);
    plot(counts/sum(counts));
    hold on;
    plot(poisspdf(1:1000, mean(counts)), 'r');
    axis([0,50,0,0.4]);
    xlabel('Count Frequency');
    ylabel('Number Of Observations');
    str = sprintf('Count Distribution for k = %d', i-1);
    title(str);
    legend('Actual Dist', 'Poisson Dist');
end
