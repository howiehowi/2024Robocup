function [center3D, corner3D] = extractObject3DCoordinates(points3D, bbox, fx, fy, cx, cy)
    % 计算给定边界框的中心点和角点的3D坐标
    % bbox格式为[x, y, width, height]
    objX = bbox(1);
    objY = bbox(2);
    objWidth = bbox(3);
    objHeight = bbox(4);

    % 计算中心点在2D图像中的坐标
    centerX2D = objX + objWidth / 2;
    centerY2D = objY + objHeight / 2;

    % 计算角点在2D图像中的坐标
    cornerX2D = objX;
    cornerY2D = objY;

    % 将2D坐标转换为3D坐标
    centerZ = double(points3D(centerY2D, centerX2D, 3)) / 1000; % 假设深度值已转换为米
    center3D = [(centerX2D - cx) * centerZ / fx, (centerY2D - cy) * centerZ / fy, centerZ];

    cornerZ = double(points3D(cornerY2D, cornerX2D, 3)) / 1000; % 假设深度值已转换为米
    corner3D = [(cornerX2D - cx) * cornerZ / fx, (cornerY2D - cy) * cornerZ / fy, cornerZ];
end
