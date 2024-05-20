function go_to_bottle_bin(jointPub, jointMess, gripperCommand, gripAct, gripGoal)
gripperX = -0.44;
gripperY = -0.45;
gripperZ = 0.35;
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

pause(3)
gripper_command (4, gripperCommand, gripAct, gripGoal)
pause(1)

send_to_position(-0.44,-0.45,0.15,jointPub,jointMess)


% send_to_position(0.35,0.01,0.5, jointPub,jointMess)
% pause(1)
end