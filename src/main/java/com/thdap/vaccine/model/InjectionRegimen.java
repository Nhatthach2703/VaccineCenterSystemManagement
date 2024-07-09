package com.thdap.vaccine.model;

public class InjectionRegimen {
    private int injectionRegimenID;
    private String object;
    private String diseasePreventionVaccine;
    private String ageMilestone;
    private String content;

    // Constructor
    public InjectionRegimen() {
    }

    public InjectionRegimen(int injectionRegimenID, String object, String diseasePreventionVaccine, String ageMilestone, String content) {
        this.injectionRegimenID = injectionRegimenID;
        this.object = object;
        this.diseasePreventionVaccine = diseasePreventionVaccine;
        this.ageMilestone = ageMilestone;
        this.content = content;
    }

    // Getters and Setters
    public int getInjectionRegimenID() {
        return injectionRegimenID;
    }

    public void setInjectionRegimenID(int injectionRegimenID) {
        this.injectionRegimenID = injectionRegimenID;
    }

    public String getObject() {
        return object;
    }

    public void setObject(String object) {
        this.object = object;
    }

    public String getDiseasePreventionVaccine() {
        return diseasePreventionVaccine;
    }

    public void setDiseasePreventionVaccine(String diseasePreventionVaccine) {
        this.diseasePreventionVaccine = diseasePreventionVaccine;
    }

    public String getAgeMilestone() {
        return ageMilestone;
    }

    public void setAgeMilestone(String ageMilestone) {
        this.ageMilestone = ageMilestone;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public String toString() {
        return "InjectionRegimen{" +
                "injectionRegimenID=" + injectionRegimenID +
                ", object='" + object + '\'' +
                ", diseasePreventionVaccine='" + diseasePreventionVaccine + '\'' +
                ", ageMilestone='" + ageMilestone + '\'' +
                ", content='" + content + '\'' +
                '}';
    }
}
