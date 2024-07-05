function change_units(xscale,yscale,zscale)
  xticklabels(cellfun(@(x) str2double(x) * xscale, xticklabels));  
  yticklabels(cellfun(@(x) str2double(x) * yscale, yticklabels));
  ylabel('μm')
  xlabel('μm')

  if nargin == 3 % zscore in the inputs
    labels=zticklabels;
    for i =1:length(labels)
        if ~isempty(labels{i})
            labels{i}=str2double(labels{i}) * zscale;
        end
    end
    zticklabels(labels);
    zlabel('μm')
  end
end