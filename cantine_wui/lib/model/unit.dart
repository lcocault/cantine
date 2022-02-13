enum Unit { none, gram, liter }

// Factories
unitFromJson(value) {
  switch (value) {
    case 'g':
      return Unit.gram;
    case 'L':
      return Unit.liter;
    default:
      return Unit.none;
  }
}
