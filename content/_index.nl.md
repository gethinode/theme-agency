---
_schema: default
title: Word een digitale leider
description: Een landingspagina voor je bedrijf gebaseerd op Hugo en Bootstrap 5.
content_blocks:
  - _bookshop_name: hero
    heading:
      title: Word een **digitale leider**
      content: >-
        Groei je omzet met een uitmuntende klantbeleving. Wij helpen je met de
        digitale transformatie van je bedrijf. Van concept tot realisatie.
      align: start
      size: 1
      width: 6
    illustration:
      image: /static/img/logo-dark.svg
      width: 10
    links:
      - title: Neem contact op
        url: '#!'
        icon: chevron-right
    orientation: horizontal
    fluid: true
    cover: true

  - _bookshop_name: testimonials
    cols: 5
    background:
      color: body-tertiary
    icon_style: fa-fluid text-secondary
    align: center
    testimonials:
      - icon: fab github
      - icon: fab node
      - icon: fab unsplash
      - icon: fab font-awesome
      - icon: fab sass

  - _bookshop_name: cards
    heading:
      preheading: Onze kernwaarden
      title: Datagedreven waardecreatie met een menselijke aanpak
    cols: 3
    padding: 0
    elements:
      - title: Persoonlijk
        icon: person-arms-up
        content: >-
          Mensen vormen het hart van iedere organisatie. Wij zetten de mens
          centraal in onze aanpak voor digitale transformatie.
      - title: Gedreven door waarde
        icon: heart
        content: Wij zorgen voor een duidelijke waarde van je digitale investering.
      - title: Technisch onderlegd
        icon: cpu
        content: >-
          Technologie ontwikkelt zich enorm snel. Wij helpen je met het bepalen
          en implementeren van de juiste oplossing.

  - _bookshop_name: about
    heading:
      preheading: Wat we doen
      title: Experts in digitalisering
      content: >-
        Wij helpen bedrijven om een digitale leider te worden in hun industrie. We
        hebben toonaangevende ervaring met meer dan 50% van de bedrijven uit de
        Fortune 500. Neem contact met ons op om te verkennen hoe we je kunnen
        helpen.
      align: start
    width: 8
    illustration:
      image: /assets/img/pexels-motional-studio-1081685.jpg
    links:
      - title: Neem contact op
        url: '#!'
        icon: chevron-right
    order: first
    background:
      color: primary
      subtle: true

  - _bookshop_name: cards
    heading:
      preheading: Onze diensten
      title: Van concept tot realisatie
      content: >-
        We bieden een breed spectrum aan diensten om je te helpen met de digitale
        transformatie van je bedrijf.
      align: start
    background:
      color: body-tertiary
    orientation: horizontal
    padding: 0
    elements:
      - title: Strategie & transformatie
        icon: star-fill
        content: >-
          We helpen met het vormgeven van een aantrekkelijke en tastbare
          digitale strategie die bijdraagt aan de bedrijfsdoelstellingen.
        link: /nl/diensten/strategie-transformatie/
      - title: Experience Design
        icon: hand-thumbs-up-fill
        content: >-
          We digitaliseren je processen, producten en diensten om de ervaring
          van je klanten naar het volgende niveau te tillen.
        link: /nl/diensten/experience-design/
      - title: Platform Engineering
        icon: stack
        content: >-
          We ontwerpen en implementeren een modern technologieplatform dat
          meeschaalt met je bedrijf.
        link: /nl/diensten/platform-engineering/

  - _bookshop_name: articles
    heading:
      preheading: Blog
      title: Recente artikelen
      align: start
    hide_empty: false
    header_style: none
    input:
      section: blog
      reverse: true
      sort: date
    more:
      title: Meer artikelen
    cols: 3
    padding: 0
    limit: 3
---
