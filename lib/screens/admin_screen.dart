import 'package:flutter/material.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    Widget content = Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Panel Administrador', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: colors.primary)),
        const SizedBox(height: 12),
        Row(children: [
          Expanded(child: Card(child: Padding(padding: const EdgeInsets.all(12.0), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [Text('Usuarios activos', style: TextStyle(fontWeight: FontWeight.bold)), SizedBox(height: 8), Text('1,234')])))),
          const SizedBox(width: 12),
          Expanded(child: Card(child: Padding(padding: const EdgeInsets.all(12.0), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [Text('Reportes', style: TextStyle(fontWeight: FontWeight.bold)), SizedBox(height: 8), Text('12 pendientes')])))),
        ]),
        const SizedBox(height: 16),
        Card(child: ListTile(leading: const Icon(Icons.rule), title: const Text('Revisar reportes'), trailing: ElevatedButton(onPressed: () {}, child: const Text('Ver')))),
        const SizedBox(height: 12),
        Expanded(child: ListView.builder(itemCount: 5, itemBuilder: (context, i) => Card(child: ListTile(leading: const Icon(Icons.person), title: Text('Usuario ${i + 1}'), subtitle: const Text('Última actividad: ayer'))))),
      ]),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Administrador'), backgroundColor: colors.primary),
      drawer: _buildDrawer(context, colors),
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth >= 900) {
          return Row(children: [
            NavigationRail(selectedIndex: 0, onDestinationSelected: (i) {}, labelType: NavigationRailLabelType.all, destinations: const [
              NavigationRailDestination(icon: Icon(Icons.dashboard), label: Text('Dashboard')),
              NavigationRailDestination(icon: Icon(Icons.people), label: Text('Usuarios')),
              NavigationRailDestination(icon: Icon(Icons.report), label: Text('Reportes')),
            ]),
            const VerticalDivider(thickness: 1, width: 1),
            Expanded(child: content),
          ]);
        }

        return content;
      }),
    );
  }

  Drawer _buildDrawer(BuildContext context, ColorScheme colors) {
    return Drawer(
      child: Column(children: [
        DrawerHeader(decoration: BoxDecoration(gradient: LinearGradient(colors: [colors.primary, colors.secondary ?? colors.primary])), child: Align(alignment: Alignment.bottomLeft, child: Text('Admin', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)))),
        ListTile(leading: const Icon(Icons.dashboard), title: const Text('Dashboard'), onTap: () => Navigator.pop(context)),
        ListTile(leading: const Icon(Icons.people), title: const Text('Usuarios'), onTap: () {}),
        ListTile(leading: const Icon(Icons.settings), title: const Text('Ajustes'), onTap: () {}),
        const Spacer(),
        ListTile(leading: const Icon(Icons.logout), title: const Text('Cerrar sesión'), onTap: () {}),
      ]),
    );
  }
}
