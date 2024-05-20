function objectPoints3D = extractObjectPoints3D(points3D, bbox, height, width, fx, fy, cx, cy)
    % 初始化物体点云数组
    objectPoints3D = [];
    
    % 边界框参数
    bboxX = bbox(1);
    bboxY = bbox(2);
    bboxWidth = bbox(3);
    bboxHeight = bbox(4);
    
    % 转换边界框坐标到点云索引
    for v = max(1, round(bboxY)):min(height, round(bboxY+bboxHeight))
        for u = max(1, round(bboxX)):min(width, round(bboxX+bboxWidth))
            Z = double(points3D((v-1)*width+u, 3)); % 获取深度值
            if Z > 0 % 检查Z值确保点在相机前方
                X = (u - cx) * Z / fx;
                Y = (v - cy) * Z / fy;
                objectPoints3D = [objectPoints3D; [X, Y, Z]];
            end
        end
    end
end
