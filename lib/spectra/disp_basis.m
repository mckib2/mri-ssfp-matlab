function [ h ] = disp_basis(Q,titl)
    h = figure;
    title(titl);
    N = size(Q,2);
    for k = 1:N
        subplot(N,1,k);
        plot(abs(Q(:,k)));
    end
    
    figure;
    title('Phase');
    for k = 1:N
        subplot(N,1,k);
        plot(angle(Q(k,:)));
    end
end