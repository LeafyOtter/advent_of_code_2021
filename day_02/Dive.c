#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>

#define FORWARD strlen("forward")
#define UP strlen("up")
#define DOWN strlen("down")

void	part_one(FILE *stream)
{
	int		x, y; // x is horizontal position, y is depth
	char	buffer[32];

	x = y = 0;
	while (fgets(buffer, 32, stream))
	{
		if (!strncmp(buffer, "forward", FORWARD))
			x += atoi(buffer + FORWARD);
		if (!strncmp(buffer, "down", DOWN))
			y += atoi(buffer + DOWN);
		if (!strncmp(buffer, "up", UP))
			y -= atoi(buffer + UP);
	}
	printf("Horizontal position : %i\nDepth : %i\nAnswer : %i\n", x, y, x * y);
	return ;
}

void	part_two(FILE *stream)
{
	int		x, x2, y, aim;
	char	buffer[32];

	x = x2 = y = aim = 0;
	while (fgets(buffer, 32, stream))
	{
		if (!strncmp(buffer, "forward", FORWARD)) {
			x2 = atoi(buffer + FORWARD);
			x += x2;
			y += aim * x2;
		}
		if (!strncmp(buffer, "down", DOWN))
			aim += atoi(buffer + DOWN);
		if (!strncmp(buffer, "up", UP))
			aim -= atoi(buffer + UP);
	}
	printf("Horizontal position : %i\nDepth : %i\nAnswer : %i\n", x, y, x * y);
	return ;
}

int	main(int ac, char **av)
{
	FILE	*stream;

	if (ac == 1) {
		printf("Missing arguments: Expecting two arguments.\n%s", \
		"\t- input file\n\t- part_1 or part_2\n");
		return (1);
	}
	stream = fopen(av[1], "r");
	if (!stream) {
		printf("Error: %s\n", strerror(errno));
		return (1);
	}
	if (!strcmp(av[2], "part_1"))
		part_one(stream);
	else if (!strcmp(av[2], "part_2"))
		part_two(stream);
	else {
		printf("Error: Expecting second to be part_1 or part_2");
		return (1);
	}
	fclose(stream);
	return (0);
}