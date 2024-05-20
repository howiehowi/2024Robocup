function orientation = determineOrientation(ptCloud)
    % 定义有意义的深度值范围
    minDepth = -1000.0000; % 最小深度值，单位米
    maxDepth = 0.001; % 最大深度值，单位米

    % 过滤点云数据
    validIndices = ptCloud.Location(:,3) > minDepth & ptCloud.Location(:,3) < maxDepth;
    filteredPoints = ptCloud.Location(validIndices, :);

    if isempty(filteredPoints)
        disp('过滤后的点云为空，无法判断朝向。');
        orientation = 'unknown';
        return;
    end

    % 计算过滤后点云的边界框
    bbox = [min(filteredPoints); max(filteredPoints)];
    sizeX = bbox(2,1) - bbox(1,1);
    sizeY = bbox(2,2) - bbox(1,2);
    sizeZ = bbox(2,3) - bbox(1,3);

    % 比较X、Y、Z三个维度的尺寸
    if sizeZ > max(sizeX, sizeY)
        orientation = 'standing';
    else
        orientation = 'lying';
    end
end