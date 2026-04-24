# EV1CicloSoftware2
Repositorio para la evaluación N°1 de Ciclo del Software II

# TechMarket - Core Service CI/CD Pipeline

**Autor:** Leonardo Sepúlveda y Leonardo Vivanco
**Asignatura:** Ciclo de Vida del Software

---

## Visión General del Proyecto

Este repositorio contiene la implementación del servicio principal (`techmarket-core-service-lslv`) y su respectiva automatización del ciclo de vida del software mediante un pipeline de Integración y Despliegue Continuo (CI/CD) utilizando GitHub Actions.

El objetivo central de este proyecto no es solo la automatización técnica, sino la creación de plantillas reutilizables que estandarizan el desarrollo y aportan un valor medible al negocio, acelerando la entrega de software y garantizando la calidad en cada etapa.

---

## Justificación de Negocio y Medición de Impacto

La implementación de este pipeline estandarizado mediante plantillas de GitHub Actions genera un impacto directo en los objetivos estratégicos de TechMarket:

### 1. Reducción del Time-to-Market (Tiempo de Comercialización)
Al utilizar plantillas reutilizables (`template_test.yml`, `template_build.yml`, `template_deploy.yml`), los equipos de desarrollo ya no necesitan configurar flujos desde cero. Esto acelera drásticamente la entrega de nuevas características de negocio, permitiendo despliegues automáticos a los entornos de validación (`pruebaslslv`) en minutos en lugar de horas.

### 2. Disminución de Riesgos y Errores Humanos
El pipeline asegura que ningún código llega a despliegue sin antes pasar por pruebas. La estandarización evita errores manuales de configuración en las credenciales o en los entornos, garantizando que el ciclo de vida del software sea predecible, seguro y auditable.

### 3. Escalabilidad Organizacional
La arquitectura basada en parámetros (`inputs` y `secrets`) permite que estas mismas plantillas puedan ser consumidas por futuros microservicios de TechMarket sin esfuerzo adicional. Esto optimiza los costos operativos, ya que centraliza el mantenimiento del ciclo de vida en un solo lugar.

---

## Arquitectura del Ciclo de Vida (CI/CD)

El flujo automatizado se compone de tres fases secuenciales invocadas desde un pipeline principal (`techmarket_pipeline.yml`), las cuales consumen flujos de trabajo reutilizables:

1. **Fase de Pruebas (Integración Continua):**
   - Instala dependencias en un entorno aislado (`npm install`).
   - Ejecuta las pruebas unitarias para asegurar la integridad del código antes de empaquetar.
2. **Fase de Construcción (Entrega Continua):**
   - Construye la imagen Docker de la aplicación.
   - Etiqueta la imagen con el SHA del commit para trazabilidad.
   - Autentica y empuja la imagen a un registro seguro en Amazon ECR.
3. **Fase de Despliegue (Despliegue Continuo):**
   - Autentica contra el clúster de Kubernetes (EKS).
   - Inyecta la nueva imagen de forma automatizada en el namespace correspondiente (`pruebaslslv`), actualizando el servicio sin tiempo de inactividad.

---

## Parámetros y Configuración

Para garantizar la seguridad y reusabilidad, el pipeline no contiene datos "quemados" (hardcoded). Para que el flujo funcione, el repositorio debe contar con los siguientes **Secrets** configurados en GitHub:

* `AWS_ACCESS_KEY_ID`: Credencial de acceso a AWS.
* `AWS_SECRET_ACCESS_KEY`: Clave secreta de acceso a AWS.
* `AWS_SESSION_TOKEN`: Token de sesión temporal (si aplica).
* `AWS_REGION`: Región donde residen los recursos (ej. us-east-1).
* `EKS_CLUSTER_NAME`: Nombre del clúster de destino.

*(Nota: Todos los secretos son consumidos por el orquestador principal e inyectados a las plantillas a través de variables de entrada para mantener la encapsulación).*
