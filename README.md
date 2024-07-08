## Aspectos generales

#### Objetivos del documento:
Con el presente manual se espera explicar a usuarios de la aplicación de cualquier nivel de conocimiento cómo utilizar la apicación y cómo instalarla, así como aclarar detalles sobre la estructuración del proyecto al momento de su desarrollo y vida útil.

#### Descripción general
La aplicación Walkmate es una herramienta diseñada en Dart para dispositivos móviles para ayudar a nuevos estudiantes y visitantes a navegar por el campus de la Universidad Centroamericana "José Simeón Cañas". La aplicación proporciona rutas detalladas con tiempo estimado que este conlleva y un mapa interactivo con edificios clave, aulas, biblioteca, cafeterías y otros puntos de interés dentro del campus. Su objetivo es facilitar la orientación y mejorar la experiencia de todos aquellos que no estén familiarizados con la estructura interna de la universidad.


## *tecnologías utilizadas*

### Requisitos del Sistema

#### Requerimientos de Hardware

-   **Dispositivo Android**: Teléfono o tableta con Android 5.0 (Lollipop) o superior.
-   **Procesador**: ARMv7 (Cortex) con soporte NEON o Atom (Mínimo de 1 GHz).
-   **Memoria RAM**: Mínimo 2 GB.
-   **Almacenamiento**: Al menos 500 MB de espacio libre para la instalación de la aplicación, datos del mapa y almacenamiento adicional de información.

#### Requerimientos de Software

-   **Sistema Operativo**: Android 5.0 (Lollipop) o superior.
-   **Archivo de Instalación**: .apk de WalkMate.

#### Requerimientos Adicionales

-   **Internet**: Conexión estable para descargar datos del mapa y recibir actualizaciones.
-   **Permisos de Ubicación**: Para proporcionar direcciones basadas en la ubicación actual del usuario.
-   **Permisos de Almacenamiento**: Para guardar mapas en caché y otros datos necesarios.


### Software utilizado

**Dart**: Lenguaje de programación desarrollado por Google, utilizado para construir aplicaciones frontend de alta calidad y rendimiento. Dart es el lenguaje base para Flutter.

![Dart](https://swansoftwaresolutions.com/wp-content/uploads/2020/02/08.20.20-What-is-Dart-and-how-is-it-used-1320x742.jpg)

**Flutter**: Framework de UI de código abierto de Google que facilita la creación de aplicaciones nativas para Android e iOS utilizando un solo código base en Dart. Proporciona un rendimiento cercano al nativo y una experiencia de usuario fluida.

![Flutter](https://www.donnfelker.com/wp-content/uploads/2019/05/flutter.png)

**TypeScript**: lenguaje de programación libre y de código abierto desarrollado y mantenido por Microsoft. Es un superconjunto de JavaScript, el cual añade tipos estáticos y objetos basados en clases.

![TypeScript](https://cdn.thenewstack.io/media/2022/01/10b88c68-typescript-logo.png)

**Mapbox**: Plataforma de mapeo que proporciona mapas personalizados y servicios de geolocalización. Se utiliza junto con la API de GraphHopper para ofrecer direcciones y rutas óptimas dentro del campus.

![Mapbox](https://assets.website-files.com/5d3ef00c73102c436bc83996/5d3ef00c73102c1f23c83a2a_logo-reversed.png)

**GraphHopper API**: Motor de enrutamiento de código abierto que proporciona direcciones y rutas optimizadas, integrado con Mapbox para ofrecer direcciones precisas en el campus.

![GraphHopper](http://toolbox.hub-charleroi.be/sites/default/files/inline-images/RoutaR-GraphHopper_logo.PNG)

**NestJS**: Framework de desarrollo back-end para Node.js que permite construir aplicaciones del lado del servidor de manera eficiente, utilizado para crear y gestionar la API de la aplicación.

![NestJS](https://i.ytimg.com/vi/9DmorFYl44M/maxresdefault.jpg)

**PostgreSQL**: Sistema de gestión de bases de datos relacional de código abierto.

![PostgreSQL](https://webapp.io/blog/content/images/2019/11/postgres.png)

**PostGIS**: Extensión espacial para PostgreSQL que permite el almacenamiento y la consulta de datos geoespaciales necesarios para la información del mapa del campus.

![PostGIS](https://www.osgeo.org/wp-content/uploads/postgis-logo-1.png)

**Visual Studio Code (VS Code)**: Editor de código fuente ligero y potente, utilizado por los desarrolladores para escribir y depurar el código de la aplicación.

![VSCode](https://python-climbing.com/wp/wp-content/uploads/2019/10/vscode_icon-1024x576.png)
## Arquitectura del Sistema

### Domain Driven Design (DDD)

**Domain Driven Design (DDD):** Este se enfoca en comprender y modelar el dominio del negocio en el que se está trabajando, centrándose en la colaboración desarrolladores y expertos en el área para crear un modelo de dominio lo más apegado posible a los procesos y normas de un negocio.
Es un patrón de diseño que divide sistemas complejos en subdominios y contextos delimitados, asegurando que cada parte del software esté alineada con los objetivos del negocio. Utiliza una subdivición de Presentation, Domain e Infrastructure para mantener una separación clara de responsabilidades, lo qu simplifica el desarrollo, mantenimiento y escalabilidad de la aplicación en un futuro.

#### Presentation Layer:

Maneja la interfaz de usuario y la interacción con el usuario.
Desarrollada con Flutter, donde los usuarios interactúan con el mapa y las direcciones.

#### Domain Layer:

Contiene la lógica de negocio y las reglas del dominio.
Son los modelos y servicios que manejan la lógica de rutas, ubicaciones y la interacción con los datos geoespaciales.

#### Infrastructure Layer:

Proporciona la implementación técnica para soportar la capa de dominio, incluyendo la persistencia de datos y las integraciones externas.
Integrado con PostgreSQL/PostGIS para almacenamiento de datos geoespaciales, y el uso de Mapbox y GraphHopper API para la visualización y enrutamiento.

#### Diagrama Relacional

![Diagram](https://i.ibb.co/y6kXRWJ/UCAWalkmate-Diagram.jpg)

## Guía de instalación

 - Descargar el archivo .apk desde la sección de "Releases".
 - En la configuración del dispositivo móbil, sea "Seguridad" o "Privacidad", habilitar la opción de instalar aplicaciones de fuentes desconocidas.
 - Instalar la aplicación desde el administrador de archivos en el dispositivo móbil.
 - Posteriormente acceder a la aplicación desde el menú del móbil.

## Tipos de error

UCA Walkmate plantea ser la sucesora inoficial de UCA Maps, de la cual se tomó inspiración para desarrollar la aplicación, esta, sin embargo, no se pudo retomar por incompatibilidades y cambios de funcionamiento en de las diferentes versiones de herrramientas utilizadas durante su desarrollo, es por esto que solamente se tomó el concepto y no el código, siendo este el primer error con el que se tuvo que lididar.

Posteriormente a esto, al momento de diseñar y desarrollar la aplicación, se utilizó ya propiamente un software de administración de proyectos Gitproject.
En este se llevó un control detallado de tanto las tareas por realizar así como como errores que se iban descubriendo y que debían ser solventados, estos se iban agregando a las tareas por hacer y es aquí donde se les puede dar seguimiento y observar el estado de cada tarea de manera sencilla, facilitando la administración y la distribución de los recursos necesarios para su implementación.

  #### Tablero
  
Se utilizó GitProject para llevar control del trabajo a realizar:
https://github.com/orgs/UCA-Walkmate/projects/1/views/1
