/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.thdap.vaccine.model;

/**
 *
 * @author Xuan Vinh
 */
public class FrequentlyAskedQuestions {
    private int questionID;
    private String shortenedQuestion;
    private String question;
    private String answer;

    public FrequentlyAskedQuestions() {
    }

    public FrequentlyAskedQuestions(int questionID, String shortenedQuestion, String question, String answer) {
        this.questionID = questionID;
        this.shortenedQuestion = shortenedQuestion;
        this.question = question;
        this.answer = answer;
    }

    public int getQuestionID() {
        return questionID;
    }

    public void setQuestionID(int questionID) {
        this.questionID = questionID;
    }

    public String getShortenedQuestion() {
        return shortenedQuestion;
    }

    public void setShortenedQuestion(String shortenedQuestion) {
        this.shortenedQuestion = shortenedQuestion;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    @Override
    public String toString() {
        return "FrequentlyAskedQuestions{" + "questionID=" + questionID + ", shortenedQuestion=" + shortenedQuestion + ", question=" + question + ", answer=" + answer + '}';
    }
    
    
}
