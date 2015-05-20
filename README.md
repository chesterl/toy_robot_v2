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

This is my second revision on this exercise. I've attempted to utilize better TDD practices and OOP practices in this second version.

In this revision, I've broken up the `simulation` into simpler components and simplified the way the robot processes commands. All the case statements were removed and commands are evaluated by the `send` method.

**Things I changed**

On a second refactoring, I applied some of the principles from the book 'POODR' by Sandi Metz. Some of the changes include:

- removing unnecessary inheritance
- reducing usage of instance variable references (used wrapper methods)
- changing arguments to a hash
- additional tests for thoroughness

On a third refactoring, I decoupled the robot entirely of other objects and moved all the command processing/checking to the `Simulation`. Doing this resolved some issues that I mentioned in the previous versions of the README. See commit history to see previous README comments.

**Things I want to see improved**

In my third refactoring, I made some trade offs by adding more conditional checks in the `simulation` and eliminating more dependencies in the `robot` class.

By moving all the command checks outside of the robot, I was able to remove the `return if args[:placement]` line in the `robot` which was bothering me. The simulation now has lengthier `if` statements as well as more methods for checking valid commands, but it keeps the other classes cleaner and less dependent.

I would love to hear any input on the above remarks or other suggestions/comments related to the exercise.

## License

MIT License

## Contributing

If you have any input on design or code considerations, please feel free to reach out to me or send a pull request.


