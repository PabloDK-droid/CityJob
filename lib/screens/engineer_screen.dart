import 'package:flutter/material.dart';

class EngineerScreen extends StatelessWidget {
  const EngineerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    Widget content = Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Panel Ingeniero', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: colors.primary)),
        const SizedBox(height: 12),
        Card(child: Padding(padding: const EdgeInsets.all(12.0), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [Text('Proyectos asignados', style: TextStyle(fontWeight: FontWeight.bold)), SizedBox(height: 8), Text('3 proyectos activos')]))),
        const SizedBox(height: 12),
        ElevatedButton.icon(onPressed: () {}, icon: const Icon(Icons.add_task), label: const Text('Nuevo reporte técnico')),
        const SizedBox(height: 16),
        const Text('Tareas pendientes', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Expanded(child: ListView.builder(itemCount: 5, itemBuilder: (context, i) => Card(child: ListTile(leading: const Icon(Icons.engineering), title: Text('Tarea ${i + 1}'), subtitle: const Text('Prioridad: Media'))))),
      ]),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Ingeniero'), backgroundColor: colors.primary),
      drawer: _buildDrawer(context, colors),
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth >= 800) {
          return Row(children: [
            NavigationRail(selectedIndex: 0, onDestinationSelected: (i) {}, labelType: NavigationRailLabelType.all, destinations: const [
              NavigationRailDestination(icon: Icon(Icons.dashboard), label: Text('Proyectos')),
              NavigationRailDestination(icon: Icon(Icons.timeline), label: Text('Cronograma')),
              NavigationRailDestination(icon: Icon(Icons.checklist), label: Text('Reportes')),
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
        DrawerHeader(decoration: BoxDecoration(gradient: LinearGradient(colors: [colors.primary, colors.secondary ?? colors.primary])), child: Align(alignment: Alignment.bottomLeft, child: Text('Ingeniero', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)))),
        ListTile(leading: const Icon(Icons.dashboard), title: const Text('Proyectos'), onTap: () => Navigator.pop(context)),
        ListTile(leading: const Icon(Icons.schedule), title: const Text('Cronograma'), onTap: () {}),
        ListTile(leading: const Icon(Icons.report), title: const Text('Reportes técnicos'), onTap: () {}),
        const Spacer(),
        ListTile(leading: const Icon(Icons.logout), title: const Text('Cerrar sesión'), onTap: () {}),
      ]),
    );
  }
}
