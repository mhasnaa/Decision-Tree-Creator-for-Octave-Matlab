% Decision Tree Creator
% Jeffrey Jedele, 2011

function decision_tree(X, Y, recursion_depth)

    if nargin != 3
        recursion_depth = 0;
        printf("Root Node\n")
    endif;

    if length(Y)<1
        printf("no nodes\n", recursion_depth);
    elseif length(unique(Y))==1
        printf("leaf node for class %d\n", Y(1));
    else
        
        [col, igain] = infogain(X,Y);
        printf("split on feature %d (info gain: %f)\n", col, igain);

        features = unique(X(:,col));
        for f=features'
            printf("Depth: %d - Feature Branch: %d\n", recursion_depth, f);
            pos = find(X(:,col)==f);
            decision_tree(X(pos,:), Y(pos,:), recursion_depth+1);
        endfor;

    endif;

endfunction
