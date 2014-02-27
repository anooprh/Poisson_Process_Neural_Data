r0 = 30;
rmax = 60;
smax = pi /2;
klist = 0:7;
slist = klist * pi /4;

lambda_list = r0 + (rmax - r0) * cos(slist - smax);

%Cell for holding 8 trials
cell_holder = cell(size(lambda_list,2),1);


% Size of each step
dt = 0.001;
% Window length in seconds
window_length = 1;
% Time chain
time = 0.0000:dt:window_length;

for lambda_indes = 1:size(lambda_list,2)
    lambda = lambda_list(lambda_indes);
    spike_train_container = cell(100,1);
    for k = 1:100
        spike_train = zeros(1, size(time, 2));
        % Poissrnd, rand - Using method 2 discussed in class
        number_of_spikes = poissrnd(lambda * window_length);
        time_of_spikes = rand(1, number_of_spikes) * window_length;
        time_of_spikes = floor(time_of_spikes * 100)/100;

        for i=time_of_spikes
            if i ~= 0
                spike_train(floor(i * 1000)) = 1;
            end
        end
        spike_train_container(k) = mat2cell(spike_train);
    end
    cell_holder(lambda_indes) = mat2cell(spike_train_container);
end

for i=1:7
    spike_train_container = cell_holder{i};
    figure;
    for j=1:100
        rand_five = randi([1,100], 1, 5);
        [st1, st2, st3, st4, st5]  = spike_train_container{rand_five};
        st = [st1; st2; st3; st4; st5];
        for k=1:5
            subplot(5,1,k);
            stem(st(k,:));
            xlabel('Time (ms)');
            ylabel('Spikes');
            title_str = sprintf('K = %d', klist(i));
            title(title_str);
        end
    end
end

