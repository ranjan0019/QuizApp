USE OnlineQuizApp_DB;
GO

IF OBJECT_ID('sp_AddQuestion', 'P') IS NOT NULL
    DROP PROCEDURE sp_AddQuestion;
GO

CREATE PROCEDURE sp_AddQuestion
    @QuizId INT,
    @QuestionText NVARCHAR(500),
    @QuestionType NVARCHAR(50),
    @CorrectAnswer NVARCHAR(500),
    @Marks INT
AS
BEGIN
    INSERT INTO Questions (QuizId, QuestionText, QuestionType, CorrectAnswer, Marks)
    VALUES (@QuizId, @QuestionText, @QuestionType, @CorrectAnswer, @Marks);

    SELECT SCOPE_IDENTITY();
END
GO

IF OBJECT_ID('sp_AddQuestionOption', 'P') IS NOT NULL
    DROP PROCEDURE sp_AddQuestionOption;
GO

CREATE PROCEDURE sp_AddQuestionOption
    @QuestionId INT,
    @OptionText NVARCHAR(200)
AS
BEGIN
    INSERT INTO QuestionOptions (QuestionId, OptionText)
    VALUES (@QuestionId, @OptionText);

    SELECT 1;
END
GO

IF OBJECT_ID('sp_GetQuestionsByQuizId', 'P') IS NOT NULL
    DROP PROCEDURE sp_GetQuestionsByQuizId;
GO

CREATE PROCEDURE sp_GetQuestionsByQuizId
    @QuizId INT
AS
BEGIN
    SELECT QuestionId, QuizId, QuestionText, QuestionType, CorrectAnswer, Marks
    FROM Questions
    WHERE QuizId = @QuizId
    ORDER BY QuestionId ASC;
END
GO

IF OBJECT_ID('sp_GetOptionsByQuestionId', 'P') IS NOT NULL
    DROP PROCEDURE sp_GetOptionsByQuestionId;
GO

CREATE PROCEDURE sp_GetOptionsByQuestionId
    @QuestionId INT
AS
BEGIN
    SELECT OptionId, QuestionId, OptionText
    FROM QuestionOptions
    WHERE QuestionId = @QuestionId
    ORDER BY OptionId ASC;
END
GO