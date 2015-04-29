# Toy Robot Simulator

## Overview:
- The application is a simulation of a toy robot moving on a square tabletop, of dimensions 5 units x 5 units.
- There are no other obstructions on the table surface.
- The robot is free to roam around the surface of the table, but must be prevented from falling to destruction. Any movement
that would result in the robot falling from the table must be prevented, however further valid movement commands must still
be allowed.

## Description

The application can read commands of the following form
- PLACE X,Y,F
- MOVE
- LEFT
- RIGHT
- REPORT

PLACE will put the toy robot on the table in position X,Y and facing NORTH, SOUTH, EAST or WEST.
- The origin (0,0) can be considered to be the SOUTH WEST most corner.
- The first valid command to the robot is a PLACE command, after that, any sequence of commands may be issued, in any order, including another PLACE command.
- The application should discard all commands in the sequence until a valid PLACE command has been executed.

MOVE will move the toy robot one unit forward in the direction it is currently facing.

LEFT and RIGHT will rotate the robot 90 degrees in the specified direction without changing the position of the robot.
REPORT will announce the X,Y and F of the robot. This can be in any form, but standard output is sufficient.

- A robot that is not on the table can choose the ignore the MOVE, LEFT, RIGHT and REPORT commands.
- Input can be from a file, or from standard input, as the developer chooses.
- Provide test data to exercise the application.

Constraints:
The toy robot must not fall off the table during movement. This also includes the initial placement of the toy robot.
Any move that would cause the robot to fall must be ignored.

Example Input and Output:

a)
PLACE 0,0,NORTH
MOVE
REPORT
Output: 0,1,NORTH

b)
PLACE 0,0,NORTH
LEFT
REPORT
Output: 0,0,WEST

c)
PLACE 1,2,EAST
MOVE
MOVE
LEFT
MOVE
REPORT
Output: 3,3,NORTH

## Dependencies

bundler
ruby => 2.1.4
rspec

##Usage

In the root directory, run `bundle install`

Run `ruby bin/toy_robot_simulation.rb` or as an excutable in bin folder - `./toy_robot_simulation.rb`
Enter commands as per instructions. Type `exit` to leave program.

##Development Environment

Created with ruby version 2.1.4p265 on OS X Mavericks 10.9.5

## Specs
Run `rspec spec/` from main directory.

## Discussion

My original attempt for this exercise can be found in this [repo](https://github.com/chesterl/toy_robot_simulator). After some feedback, I've attempted the exercise again with more considerations to TDD.

In this revision, I've broken up the `Simulation` into simpler classes and simplified the way the robot processes commands. All the case statements are removed and commands are evaluated by the `send` method.

I like the way I cleaned up the movement and command structure of the robot. I did not put commands into a module but that could still be done on further refactoring. I'm not entirely sure with my use of the directions constant in `direction.rb` because I feel there is some redundancy with its inclusion. However, I couldn't think of a simpler way to detect a valid direction. If anyone has feedback on this part, I would love to hear it.

## License

MIT License

## Contributing

If you have any input on design or code considerations, please feel free to reach out to me or send a pull request.


