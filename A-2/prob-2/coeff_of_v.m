clear;

load 'homogenous_poisson.mat';

for i=1:8
    spike_train_container = cell_holder{i};
    spike_counr_for_angle = 0;
    for j=1:100
        spike_train = spike_train_container{j};
        spike_location = find(spike_train);
        isis = spike_location(2:end) - spike_location(1:end-1);
       
    end
    m = mean(isis);
    cv = sqrt(var(isis)) / m;
    plot(cv, m, '-*r');
    hold on
    xlabel('Mean');
    ylabel('Co Effecient Of Variation');
    str = sprintf('Cv vs mean');
    title(str);
end
