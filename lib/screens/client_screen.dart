import 'package:flutter/material.dart';

class ClientScreen extends StatelessWidget {
  const ClientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    Widget content = Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Panel Cliente', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: colors.primary)),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CircleAvatar(radius: 28, backgroundColor: colors.primary, child: const Icon(Icons.person, color: Colors.white)),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Empresa ejemplo', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        SizedBox(height: 6),
                        Text('Publica y gestiona tus solicitudes de trabajo desde aquí.'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            children: [
              ElevatedButton.icon(onPressed: () {}, icon: const Icon(Icons.add), label: const Text('Publicar trabajo')),
              OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.search), label: const Text('Buscar profesionales')),
            ],
          ),
          const SizedBox(height: 20),
          const Text('Solicitudes recientes', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, i) => Card(
                child: ListTile(
                  leading: const Icon(Icons.work_outline),
                  title: Text('Servicio ${i + 1}'),
                  subtitle: const Text('Estado: Pendiente'),
                  trailing: const Icon(Icons.chevron_right),
                ),
              ),
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cliente'),
        backgroundColor: colors.primary,
      ),
      drawer: _buildDrawer(context, colors),
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth >= 800) {
          return Row(
            children: [
              NavigationRail(
                selectedIndex: 0,
                onDestinationSelected: (index) {},
                labelType: NavigationRailLabelType.all,
                destinations: const [
                  NavigationRailDestination(icon: Icon(Icons.home), label: Text('Inicio')),
                  NavigationRailDestination(icon: Icon(Icons.person_search), label: Text('Profesionales')),
                  NavigationRailDestination(icon: Icon(Icons.message), label: Text('Mensajes')),
                ],
              ),
              const VerticalDivider(thickness: 1, width: 1),
              Expanded(child: content),
            ],
          );
        }

        return content;
      }),
    );
  }

  Drawer _buildDrawer(BuildContext context, ColorScheme colors) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(gradient: LinearGradient(colors: [colors.primary, colors.secondary ?? colors.primary])),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text('Cliente', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
            ),
          ),
          ListTile(leading: const Icon(Icons.home), title: const Text('Inicio'), onTap: () => Navigator.pop(context)),
          ListTile(leading: const Icon(Icons.person), title: const Text('Perfil'), onTap: () {}),
          ListTile(leading: const Icon(Icons.message), title: const Text('Mensajes'), onTap: () {}),
          const Spacer(),
          ListTile(leading: const Icon(Icons.logout), title: const Text('Cerrar sesión'), onTap: () {}),
        ],
      ),
    );
  }
}
