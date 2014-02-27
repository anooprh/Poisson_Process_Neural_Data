clear;

load 'ps2_data';

for i=1:8
    spike_counr_for_angle = 0;
    spike_count_in_train = zeros(1,182);
    for j=1:182
        spike_train = trial(j,i).spikes;
        spike_count_in_train(j) = size(find(spike_train),2);
       
    end
    count_frequencies = unique(spike_count_in_train);
    counts = histc(spike_count_in_train,count_frequencies);
    m = mean(counts);
    variance = var(counts);
    plot(variance, m, 'dr');
%     axis([0,30,0,30]);
    hold on;
    plot(0:100, 0:100);
    xlabel('Mean');
    ylabel('Vairance');
    str = sprintf('Fano Factor ');
    title(str);
end
