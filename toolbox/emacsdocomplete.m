function emacsdocomplete(substring)
% Ask for completions of SUBSTRING from MATLAB.
% This is used by Emacs TAB in matlab-shell to provide possible
% completions.  This hides the differences between versions
% for the calls needed to do completions.

    
    matlabMCRprocess = com.mathworks.jmi.MatlabMCR;

    v = ver('MATLAB');
    
    if str2double(v.Version) < 8.4
    
        % Pre R2014b: partial_string
        matlabMCRprocess.mtFindAllTabCompletions(substring)

    else
        
        % Post R2014b: partial_string, caret, num
        matlabMCRprocess.mtFindAllTabCompletions(substring, ...
                                                 length(substring),...
                                                 0)
        
        % DEV NOTE: If you find a test failure, contact Eric Ludlam
        % to also update matlab-emacs SF repository.
        
    end
    
    clear('matlabMCRprocess');
   
end