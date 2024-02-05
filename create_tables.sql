CREATE TABLE questionnaire (
	id SERIAL PRIMARY KEY,
    name VARCHAR(127) NOT NULL UNIQUE,
    num_of_passes INT NOT NULL DEFAULT 0
);


CREATE TABLE question (
	id SERIAL PRIMARY KEY,
    text TEXT NOT NULL,
	num_of_passes INT NOT NULL DEFAULT 0,
    questionnaire_id INT NOT NULL,
    next_question_id INT,
    FOREIGN KEY (questionnaire_id) REFERENCES questionnaire (id),
    FOREIGN KEY (next_question_id) REFERENCES question (id)
);

CREATE TABLE answer_choice (
	id SERIAL PRIMARY KEY,
    text VARCHAR(255) NOT NULL,
	num_of_passes INT NOT NULL DEFAULT 0,
    question_id INT NOT NULL,
    next_question_id INT,
    FOREIGN KEY (question_id) REFERENCES question (id),
    FOREIGN KEY (next_question_id) REFERENCES question (id)
);


CREATE TABLE user_answer (
    answer_choice_id INT NOT NULL,
	user_id INT NOT NULL,
    FOREIGN KEY (answer_choice_id) REFERENCES answer_choice (id),
    FOREIGN KEY (user_id) REFERENCES users_user (id)
);
