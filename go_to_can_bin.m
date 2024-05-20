function go_to_can_bin(jointPub, jointMess,gripperCommand, gripAct, gripGoal)
gripperX = -0.44;
gripperY = 0.45;
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
send_to_position(-0.44,0.45,0.15,jointPub,jointMess)
pause(4)
gripper_command (4, gripperCommand, gripAct, gripGoal)
pause(2)
send(jointPub,jointMess);
send_to_position(-0.44,0.45,0.15,jointPub,jointMess)

end