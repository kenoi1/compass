add_executable(compass)

ecm_add_qml_module(compass
    URI
    org.kde.compass
)

target_sources(compass
    PRIVATE
    main.cpp
)

ecm_target_qml_sources(compass
    SOURCES
    Main.qml
)

target_link_libraries(compass
    PRIVATE
    Qt6::Quick
    Qt6::Qml
    Qt6::Gui
    Qt6::QuickControls2
    Qt6::Widgets
    KF6::I18n
    KF6::CoreAddons
    KF6::IconThemes
)

install(TARGETS compass ${KDE_INSTALL_TARGETS_DEFAULT_ARGS})
