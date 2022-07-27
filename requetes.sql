SELECT id_account_receiver
FROM send_invite
WHERE id_account_sender=1 AND NOT is_accepted;

SELECT first_name, last_name, nickname, profile_pic, friendship_birthday
FROM account JOIN send_invite ON id_account_receiver=id_account
WHERE (id_account_sender=1 OR id_account_receiver=1) AND is_accepted;

SELECT first_name, last_name
FROM account JOIN send_invite ON id_account_receiver=id_account
WHERE is_accepted AND (id_account_sender=1 OR id_account_receiver=1)
LIMIT(2);

SELECT receiver.first_name, sender.first_name, receiver.message_datetime, receiver.message_content, receiver.seen_datetime
FROM (account JOIN messages ON id_account_receiver=id_account) AS receiver,
(account JOIN messages ON id_account_sender=id_account) AS sender
WHERE (receiver.id_account_sender=sender.id_account_sender AND sender.id_account_receiver=receiver.id_account_receiver)
AND ((receiver.id_account_sender=1 AND receiver.id_account_receiver=2) OR (sender.id_account_receiver=1 AND sender.id_account_sender=2));

SELECT first_name, count(id_account_sender) AS nb_message
FROM account JOIN messages ON id_account= id_account_sender
GROUP BY (id_account_sender, first_name)
ORDER BY nb_message;

SELECT id_account, posting_date, posting_time, post_content
FROM post 
WHERE current_date-posting_date<=3;

SELECT post.id_account, posting_date, posting_time, post_content
FROM post JOIN react_post on post.id_post=react_post.id_post
WHERE reaction_type = 'positive'
GROUP BY (post.id_post)
ORDER BY count(reaction_type);