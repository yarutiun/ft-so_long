#####################################################################################
#####################################################################################
#####################################################################################

NAME		=	so_long
NAME_BONUS	=	so_long_bonus

#####################################################################################
#####################################################################################
#####################################################################################

CC		=	gcc

CFLAGS	=	-Wall -Wextra -Werror -lX11

MLX		=   -lmlx -lXext -lX11

LIB_FLAGS =	-L ./1-libft -lft

#####################################################################################
#####################################################################################
#####################################################################################

INCLUDE = -I ./includes

SOURCE =./source/
MOVE =	mov/
GNL = 	0-gnl/

SOURCE_B =./source_bonus/
MOVE_B =	mov/

#####################################################################################
#####################################################################################
#####################################################################################

GNSRC = 	$(addprefix $(GNL), \
		get_next_line_bonus.c get_next_line_utils_bonus.c \
)

MAP =		$(addprefix 0-map/, \
		0_map.c 1_map_validation.c 2_map_update.c 3_map_utils.c \
		4_map_render_player.c \
)

WINDOW =	$(addprefix 1-window/, \
		0_window.c 1_screen_validations.c \
)

MSRC =		$(addprefix 2-movements/, \
		mov_left.c mov_right.c mov_up.c mov_down.c mov_utils.c \
)


A_SRC =		$(addprefix $(SOURCE), \
		$(MSRC) $(MAP) $(WINDOW) \
		0_endgame.c 1_images.c \
		so_long.c \
)

MSRC_B =	$(addprefix $(MOVE_B), \
		mov_left_bonus.c mov_right_bonus.c mov_up_bonus.c mov_down_bonus.c mov_utils_bonus.c \
)

A_SRC_B =	$(addprefix $(SOURCE_B), \
		$(MSRC_B) \
		so_long_bonus.c window_bonus.c images_bonus.c map_bonus.c \
		map_update_bonus.c animation_bonus.c enemy_bonus.c \
		init_bonus.c destroy_bonus.c \
)

#####################################################################################
#####################################################################################
#####################################################################################

SRC =	$(A_SRC) $(GNSRC)

SRC_B = $(A_SRC_B) $(GNSRC)

OBJ = $(SRC:%.c=%.o)

OBJ_B =	$(SRC_B:%.c=%.o)

#####################################################################################
#####################################################################################
#####################################################################################

all: $(NAME)

bonus: $(NAME_BONUS)

%.o: %.c
	$(CC) $(CFLAGS) $(INCLUDE) -O2 -c $< -o $(<:%.c=%.o)

$(NAME): $(OBJ)
	rm -rf $(NAME)
	make all -C ./1-libft
	$(CC) $(CFLAGS) $(OBJ) $(LIB_FLAGS) $(MLX) -o $(NAME)

$(NAME_BONUS): $(OBJ_B)
	rm -rf $(NAME)
	make bonus -C ./1-libft
	$(CC) $(CFLAGS) $(OBJ_B) $(LIB_FLAGS) $(MLX) -o $(NAME)

#####################################################################################
#####################################################################################
#####################################################################################

clean:
	rm -rf $(OBJ) $(OBJ_B)
	rm -rf ./a.out
	make clean -C ./1-libft

fclean: clean
	rm -rf $(NAME) $(NAME_BONUS)
	make fclean -C ./1-libft

re: fclean all

.PHONY: all bonus clean fclean re

#####################################################################################
#####################################################################################
#####################################################################################