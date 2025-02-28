function tic_tac_toe
    clc; close all;
    global board turn buttons;
    
    board = zeros(3,3); % 3x3 board
    turn = 1; % Player 1 starts (1 for 'X', -1 for 'O')
    
    fig = figure('Name', 'Tic-Tac-Toe', 'NumberTitle', 'off', 'Position', [500, 300, 300, 350]);
    
    % Create buttons for the board
    buttons = gobjects(3,3);
    for i = 1:3
        for j = 1:3
            buttons(i,j) = uicontrol('Style', 'pushbutton', 'String', '', 'FontSize', 20, ...
                'Position', [50*(j-1)+50, 300-50*i, 50, 50], ...
                'Callback', {@button_callback, i, j});
        end
    end
    
    % Restart button
    uicontrol('Style', 'pushbutton', 'String', 'Restart', 'FontSize', 12, ...
        'Position', [100, 20, 100, 40], 'Callback', @restart_game);
end

function button_callback(~, ~, i, j)
    global board turn buttons;
    
    if board(i,j) == 0 % If the cell is empty
        if turn == 1
            buttons(i,j).String = 'X';
        else
            buttons(i,j).String = 'O';
        end
        
        board(i,j) = turn; % Update board
        if check_winner()
            msgbox(['Player ' num2str((turn+3)/2) ' wins!']);
            disable_buttons();
        elseif all(board(:) ~= 0)
            msgbox('Draw!');
            disable_buttons();
        else
            turn = -turn; % Switch turns
        end
    end
end

function win = check_winner()
    global board;
    win = any(sum(board, 1) == 3) || any(sum(board, 2) == 3) || ...
          trace(board) == 3 || trace(flipud(board)) == 3 || ...
          any(sum(board, 1) == -3) || any(sum(board, 2) == -3) || ...
          trace(board) == -3 || trace(flipud(board)) == -3;
end

function disable_buttons()
    global buttons;
    for i = 1:3
        for j = 1:3
            buttons(i,j).Enable = 'off';
        end
    end
end

function restart_game(~, ~)
    global board turn buttons;
    board = zeros(3,3);
    turn = 1;
    for i = 1:3
        for j = 1:3
            buttons(i,j).String = '';
            buttons(i,j).Enable = 'on';
        end
    end
end
