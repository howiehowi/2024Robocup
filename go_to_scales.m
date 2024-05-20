function go_to_scales(jointPub, jointMess, gripperCommand, gripAct, gripGoal)
gripperX = 0.7;
gripperY = 0.35;
gripperZ = 0.05;
gripperRotationX = -pi; % radians
gripperRotationY = 0; % radians
gripperRotationZ = 0; % radians


jointMess.Pose.Position.X = gripperX;
jointMess.Pose.Position.Y = gripperY;
jointMess.Pose.Position.Z = gripperZ;
quat = angle2quat(gripperRotationX, gripperRotationY, gripperRotationZ, "XYZ");
jointMess.Pose.Orientation.W = quat(1);
jointMess.Pose.Orientation.X = quat(2);
jointMess.Pose.Orientation.Y = quat(3);
jointMess.Pose.Orientation.Z = quat(4);
send(jointPub,jointMess);

pause(5)
gripper_command (4, gripperCommand, gripAct, gripGoal)
pause(5)

send_to_position(gripperX,gripperY,-0.1,jointPub,jointMess)
pause(5)

send_to_position(gripperX, gripperY,gripperZ+0.3,jointPub,jointMess, gripperRX, gripperRY, gripperRZ)
pause(5)


% send_to_position(0.35,0.01,0.5, jointPub,jointMess)
% pause(1)
end