% Information Gain Calculator
% Jeffrey Jedele, 2011

function [max_gain_feature, gain] = infogain(x,y)

    max_gain_feature = 0;
    info_gains = zeros(1, size(x,2));

    % calculate H(y)
    classes = unique(y);
    hy = 0;
    for c=classes'
        py = sum(y==c)/size(y,1);
        hy += py*log2(py);
    endfor;
    hy = -hy;

    % iterate over all features (columns)
    for col=1:size(x,2)
        
        features = unique(x(:,col));

        % calculate entropy
        hyx = 0;
        for f=features'
            
            pf = sum(x(:,col)==f)/size(x,1);
            yf = y(find(x(:,col)==f));
            
            % calculate h for classes given feature f
            yclasses = unique(yf);
            hyf = 0;
            for yc=yclasses'
                pyf = sum(yf==yc)/size(yf,1);
                hyf += pyf*log2(pyf);
            endfor;
            hyf = -hyf;

            hyx += pf * hyf;

        endfor;

        info_gains(col) = hy - hyx;

    endfor;

    [gain, max_gain_feature] = max(info_gains);

endfunction
