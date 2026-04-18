<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>

<petclinic:layout pageName="home">
    <spring:url value="/resources/images/pets.png" htmlEscape="true" var="petsImage"/>
    <spring:url value="/owners/find" htmlEscape="true" var="ownersUrl"/>
    <spring:url value="/vets" htmlEscape="true" var="vetsUrl"/>

    <section class="welcome-hero">
        <div class="welcome-hero__copy">
            <span class="welcome-hero__eyebrow">Modern veterinary dashboard</span>
            <h2><fmt:message key="welcome"/></h2>
            <p>Run appointments, owner records, and care updates from a polished workspace with a warmer visual identity.</p>
            <div class="welcome-hero__actions">
                <a class="btn btn-primary" href="${ownersUrl}">Find owners</a>
                <a class="btn btn-secondary" href="${vetsUrl}">View veterinarians</a>
            </div>
        </div>
        <div class="welcome-hero__visual">
            <div class="welcome-hero__image-shell">
                <img class="img-responsive" alt="A cat and a dog" src="${petsImage}"/>
            </div>
        </div>
    </section>

    <section class="welcome-grid" aria-label="Key capabilities">
        <article class="welcome-card">
            <span class="welcome-card__icon"><i class="fa fa-calendar-check-o" aria-hidden="true"></i></span>
            <h3>Visit planning</h3>
            <p>Schedule checkups and record care details with a layout that stays readable through busy clinic hours.</p>
        </article>
        <article class="welcome-card">
            <span class="welcome-card__icon"><i class="fa fa-users" aria-hidden="true"></i></span>
            <h3>Owner management</h3>
            <p>Keep customer details, pet history, and follow-up actions connected in one place.</p>
        </article>
        <article class="welcome-card">
            <span class="welcome-card__icon"><i class="fa fa-heartbeat" aria-hidden="true"></i></span>
            <h3>Care visibility</h3>
            <p>Surface the right information quickly so front desk and clinical staff can move with confidence.</p>
        </article>
    </section>
</petclinic:layout>
