<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%-- Bootstrap --%>
<spring:url value="/webjars/bootstrap/5.3.8/js/bootstrap.bundle.min.js" var="bootstrapJs"/>
<script src="${bootstrapJs}"></script>

<footer class="app-footer">
	<div class="container">
		<div class="app-footer__content">
			<div>
				<strong>PetClinic</strong>
				<p>Colorful, organized care management for pets, owners, and clinical teams.</p>
			</div>
			<span class="app-footer__meta">Designed for fast daily operations and a cleaner client-facing experience.</span>
		</div>
	</div>
</footer>

