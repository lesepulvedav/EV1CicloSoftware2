Versión 1.0.0 de trabajo para la evaluación 1 de ciclo de vida del software

Todos los cambios notables del proyecto `techmarket-core-service` serán documentados en este archivo.

# Añadido:
- Aplicación Base: Estructura inicial en Node.js (`index.js`, `package.json`) para la validación del flujo de entrega.
- Automatización CI/CD: Orquestador principal (`techmarket_pipeline.yml`) para ejecutar el ciclo de vida completo.
- Plantillas Reutilizables: Implementación de flujos modulares para pruebas (`template_test.yml`), construcción (`template_build.yml`) y despliegue (`template_deploy.yml`).
- Contenerización: Archivo `Dockerfile` para empaquetado de la aplicación de forma estandarizada.
- Integración AWS: Conexión segura mediante *secrets* para enviar imágenes a Amazon ECR.
- Despliegue Continuo: Actualización automática del servicio en el clúster Kubernetes (AWS EKS) dentro del entorno `pruebaslslv`.
- Documentación: Archivo `README.md` con la justificación de negocio y arquitectura del pipeline.

  
😺
